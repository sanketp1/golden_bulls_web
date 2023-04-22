class ResponseStatus {
  static const int SUCCESS = 200;
  static const int CREATED = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int SERVER_ERROR = 500;
  static const int SERVICE_UNAVAILABLE = 503;

  static const Map<int, String> DESCRIPTIONS = {
    SUCCESS: "Success",
    CREATED: "Created",
    BAD_REQUEST: "Bad Request",
    UNAUTHORIZED: "Unauthorized",
    FORBIDDEN: "Forbidden",
    NOT_FOUND: "Not Found",
    SERVER_ERROR: "Internal Server Error",
    SERVICE_UNAVAILABLE: "Service Unavailable"
  };

  static onError({required String status_code, required String message}) {
    return {"status_code": status_code, "message": message};
  }

  static String getDescription(int code) {
    return DESCRIPTIONS[code] ?? "Unknown";
  }
}
