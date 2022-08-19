// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrencyObj {
  String cur_unit;//통화코드
  String tts;//전신환(송금)보내실때
  String cur_nm; // 국가/통화명

  CurrencyObj({required this.cur_unit,required this.tts, required this.cur_nm});

  factory CurrencyObj.fromJson(Map<String,dynamic>json){
    return CurrencyObj(
      cur_unit: json['cur_unit'],
      tts: json['tts'],
      cur_nm: json['cur_nm'],
    );
  }

  @override
  String toString(){
    return 'CurrencyObj(cur_unit:$cur_unit, tts:$tts, cur_nm:$cur_nm)';
  }

}
