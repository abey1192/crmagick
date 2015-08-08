@[Link("MagickCore-6.Q16")]

lib LibMagickCore

  alias MagickBooleanType = Int64
  alias SizeT = UInt64
  alias SSizeT = UInt64

  MagickTrue = 1_i64
  MagickFalse = 0_i64


  struct PixelPacket
    red : Float32
    green : Float32
    blue : Float32
    opacity : Float32
  end
  
  MaxTextExtent = 4096

  struct ImageInfo
    compressionType : Int64
    orientationType : Int64

    temporary,
    adjoin,
    affirm,
    antialias : MagickBooleanType

    size,
    extract,
    page,
    scenes : UInt8*

    scene,
    numberScenes,
    depth : SizeT

    interlace : Int64
    endinan : Int64
    units : Int64
  
    quality : UInt64
    
    samplingFactor,
    serverName,
    font,
    texture,
    density : UInt8*
    
    pointsize,
    fuzz : Float64
    
    backgroundColor,
    borderColor,
    matteColor : PixelPacket
    
    dither,
    monochrome : MagickBooleanType

    colors : SizeT

    colorspace : UInt64

    type : UInt64

    previewType : UInt64
    
    group : UInt64
    
    ping,
    verbose : UInt64
    
    view,
    authenticate : UInt8*
    
    channel : UInt64

    attributes : UInt64*
    
    options : Void*
    
    progressMonitor : UInt64
  
    clientData,
    cache : Void*
    
    file : Void*
    
    blob : Void*
    
    length : UInt64

    magick,
    unique,
    zero,
    filename : UInt8[MaxTextExtent]
    
    debug : MagickBooleanType
    
    tile : UInt8*
    
    subimage,
    subrange : SizeT
    
    pen : PixelPacket
    
    signature : UInt64
    
    virtualPixelMethod : Int64
    
    transparentColor : PixelPacket
    
    profile : Void*
    
    synchronize : UInt64
  end


  fun getMagickPrecision = GetMagickPrecision(): Int64

  fun isMagickCoreInstantiated = IsMagickCoreInstantiated(): MagickBooleanType

  fun magickCoreGenesis = MagickCoreGenesis(path: UInt8*, establishSignalHandlers: MagickBooleanType): Void

  fun magickCoreTerminus = MagickCoreTerminus() : Void

  fun cloneImageInfo = CloneImageInfo(imageInfo : ImageInfo*) : ImageInfo*

  fun destroyImageInfo = DestroyImageInfo(imageInfo: ImageInfo *) : Void

end


LibMagickCore.magickCoreGenesis(".".to_unsafe, LibMagickCore::MagickFalse)

info = LibMagickCore.cloneImageInfo(nil)

# filenameを設定する
# ReadImage
# WriteImage

LibMagickCore.destroyImageInfo(info)

LibMagickCore.magickCoreTerminus()
