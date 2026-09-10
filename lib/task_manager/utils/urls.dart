class TMUrls {
  static String baseUrl = 'https://task-manager-api.ostad.live/api/v1';
  static String signUpUrl = '$baseUrl/Registration';
  static String logInUrl = '$baseUrl/Login';
  static String taskCount = '$baseUrl/taskStatusCount';
  static String taskList(String status) => '$baseUrl/listTaskByStatus/$status';
  static String createTask = '$baseUrl/createTask';
  static String deleteTask(String id) => '$baseUrl/deleteTask/$id';
  static String updateTaskStatus(String id, String status) => '$baseUrl/updateTaskStatus/$id/$status';
  static String profileUpdateUrl = '$baseUrl/ProfileUpdate';
}