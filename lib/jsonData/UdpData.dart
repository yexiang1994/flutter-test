class UdpData {
  String md5;
  String serverName;
  String uuid;
  String message;
  String chat;

  UdpData(
      {this.md5, this.serverName, this.uuid, this.message, this.chat});

  UdpData.fromJson(Map<String, dynamic> json) {
    md5 = json['md5'];
    serverName = json['serverName'];
    uuid = json['uuid'];
    message = json['message'];
    chat = json['chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['md5'] = this.md5;
    data['serverName'] = this.serverName;
    data['uuid'] = this.uuid;
    data['message'] = this.message;
    data['chat'] = this.chat;
    return data;
  }
}
