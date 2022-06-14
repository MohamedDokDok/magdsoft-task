class AccountModel {
  int? status;
  String? message;
  List<Account>? account;

  AccountModel({this.status, this.account});

  AccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['account'] != null) {
      account = <Account>[];
      json['account'].forEach((element){
        account!.add(new Account.fromJson(element));
      });
    }
  }


}

class Account {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? updatedAt;
  String? createdAt;

  Account(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.updatedAt,
        this.createdAt});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }


}