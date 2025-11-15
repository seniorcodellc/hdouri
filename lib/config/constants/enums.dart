enum DialogAnimation {
  DEFAULT,
  ROTATE,
  SLIDE_TOP_BOTTOM,
  SLIDE_BOTTOM_TOP,
  SLIDE_LEFT_RIGHT,
  SLIDE_RIGHT_LEFT,
  SCALE
}

enum GalleryFileTypes { REMOVE, CAMERA, GALLERY }

enum AlertTypes {
  loading,
  error,
  success,
  warning,
}

enum DialogTimingTypes { long, short }

enum AnimationType { fade, scale, rotate, slide, slideBottomTop }
enum SubServiceTypes { Default , washing }
enum CacheErrors { CACHE_WRITE_ERROR, CACHE_READ_ERROR }
enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_READ_ERROR,
  CACHE_WRITE_ERROR,
  CACHE_REMOVE_ERROR,
  NO_INTERNET_CONNECTION,
  BAD_CERTIFICATE_ERROR,
  CONNECTION_ERROR,
  DEFAULT, INVALIDINPUT
}
