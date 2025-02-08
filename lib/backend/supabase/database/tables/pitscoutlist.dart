import '../database.dart';

class PitscoutlistTable extends SupabaseTable<PitscoutlistRow> {
  @override
  String get tableName => 'pitscoutlist';

  @override
  PitscoutlistRow createRow(Map<String, dynamic> data) => PitscoutlistRow(data);
}

class PitscoutlistRow extends SupabaseDataRow {
  PitscoutlistRow(super.data);

  @override
  SupabaseTable get table => PitscoutlistTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get teamnumber => getField<String>('teamnumber');
  set teamnumber(String? value) => setField<String>('teamnumber', value);

  String? get expautoendgamepos => getField<String>('expautoendgamepos');
  set expautoendgamepos(String? value) =>
      setField<String>('expautoendgamepos', value);

  String? get expteleopendgamepos => getField<String>('expteleopendgamepos');
  set expteleopendgamepos(String? value) =>
      setField<String>('expteleopendgamepos', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get imgurl => getField<String>('imgurl');
  set imgurl(String? value) => setField<String>('imgurl', value);

  int? get expautosamplenet => getField<int>('expautosamplenet');
  set expautosamplenet(int? value) => setField<int>('expautosamplenet', value);

  int? get expteleopsamplenet => getField<int>('expteleopsamplenet');
  set expteleopsamplenet(int? value) =>
      setField<int>('expteleopsamplenet', value);

  int? get eventid => getField<int>('eventid');
  set eventid(int? value) => setField<int>('eventid', value);

  int? get expautohighbasketsample => getField<int>('expautohighbasketsample');
  set expautohighbasketsample(int? value) =>
      setField<int>('expautohighbasketsample', value);

  int? get expautolowbasketsample => getField<int>('expautolowbasketsample');
  set expautolowbasketsample(int? value) =>
      setField<int>('expautolowbasketsample', value);

  int? get expautohighchemberspec => getField<int>('expautohighchemberspec');
  set expautohighchemberspec(int? value) =>
      setField<int>('expautohighchemberspec', value);

  int? get expautolowchemberspec => getField<int>('expautolowchemberspec');
  set expautolowchemberspec(int? value) =>
      setField<int>('expautolowchemberspec', value);

  int? get expteleophighbasketsample =>
      getField<int>('expteleophighbasketsample');
  set expteleophighbasketsample(int? value) =>
      setField<int>('expteleophighbasketsample', value);

  int? get expteleoplowbasketsample =>
      getField<int>('expteleoplowbasketsample');
  set expteleoplowbasketsample(int? value) =>
      setField<int>('expteleoplowbasketsample', value);

  int? get expteleophighchemberspec =>
      getField<int>('expteleophighchemberspec');
  set expteleophighchemberspec(int? value) =>
      setField<int>('expteleophighchemberspec', value);

  int? get expteleoplowchemberspec => getField<int>('expteleoplowchemberspec');
  set expteleoplowchemberspec(int? value) =>
      setField<int>('expteleoplowchemberspec', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
