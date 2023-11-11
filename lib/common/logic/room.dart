class Room {
  static String roomIdGenerator(String firstId, String secondId) {
    List<String> ids = [firstId, secondId];
    ids.sort();
    String roomId = ids.join('_');
    return roomId;
  }
}
