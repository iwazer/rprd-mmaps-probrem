class MapViewController < UIViewController
  def viewDidLoad
    super
    @map_view = MMMapView.alloc.initWithFrame(self.view.bounds, key:"5c4b0a70843237a8b24cff6a785ea787")
    @map_view.delegate = self
    self.view.addSubview(@map_view)
    @map_view.setZoom(17.5, animated:false)
    coordinate = CLLocationCoordinate2DMake(35.657990, 139.708774)
    NSLog(coordinate.inspect)
    @map_view.setCenterCoordinate(coordinate, animated:false)

    # ↓これがなければ型の入れ替わりが再現しない（正常に動く）
    map_to_point = @map_view.coordinateToPixel(coordinate)
    NSLog(map_to_point.inspect)
  end

  def longSingleTap mapView, point: point
    NSLog(point.inspect)

    # ↓実際のコードではpointはCGPointで正しい型なのに
    #    `longSingleTap:point:': expected instance of `CLLocationCoordinate2D', got `#<CGPoint x=142.0 y=211.0>' (CGPoint) (TypeError)
    #    というあってるのに間違ってると言われてこの行で落ちる
    #    これを回避する方法がわからない…
    #
    # ↓このサンプルだと落ちずにCLLocationCoordinate2Dを返すはずだけどCGPointが返ってくる
    coordinate = mapView.pixelToCoordinate(point)
    NSLog(coordinate.inspect)

    # ↓CGPointなのでlongitude/latitudeアクセサないから落ちるのでコメントアウト
    #reverse_geocode(coordinate.longitude, coordinate.latitude) do |result,error|
      ## 住所受け取ってなんかするところ
      mapView.removeAnnotations(mapView.annotations)
      # ↓CLLocationCoordinate2Dを受け取るメソッドでCGPointになってるけど落ちない、でも実際のアプリでは落ちたりする（汗）
      @pin = MMAnnotationView.alloc.initWithMapView(mapView, coordinate: coordinate)
      @pin.title = "取得した住所"
      mapView.addAnnotation(@pin, animated:true)
    #end
  end

  def reverse_geocode lng, lat, &block
    # リバースジオコーダAPIを叩くコードが書かれるけど
    # 直接関係ないので割愛( ˘ω˘)
    yield
  end
end
