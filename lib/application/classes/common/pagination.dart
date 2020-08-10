class Pagination {
  //  "current_page": 1,
  //     "from": 1,
  //     "last_page": 61,
  //     "path": "http://localhost:8000/api/opportunity",
  //     "per_page": 5,
  //     "to": 5,
  //     "total": 301

  final int currentPage;
  final int lastPage;

  Pagination.fromJson(Map<String, dynamic> jsonMap)
      : currentPage = jsonMap['current_page'] ?? 0,
        lastPage = jsonMap['last_page'] ?? 0;
}
