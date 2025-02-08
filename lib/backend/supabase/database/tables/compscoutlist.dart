import '../database.dart';

class CompscoutlistTable extends SupabaseTable<CompscoutlistRow> {
  @override
  String get tableName => 'compscoutlist';

  @override
  CompscoutlistRow createRow(Map<String, dynamic> data) =>
      CompscoutlistRow(data);
}

class CompscoutlistRow extends SupabaseDataRow {
  CompscoutlistRow(super.data);

  @override
  SupabaseTable get table => CompscoutlistTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get teamnumber => getField<String>('teamnumber');
  set teamnumber(String? value) => setField<String>('teamnumber', value);

  int? get compnum => getField<int>('compnum');
  set compnum(int? value) => setField<int>('compnum', value);

  String? get comptype => getField<String>('comptype');
  set comptype(String? value) => setField<String>('comptype', value);

  String? get alliancecolor => getField<String>('alliancecolor');
  set alliancecolor(String? value) => setField<String>('alliancecolor', value);

  String? get autoendgamerobotpos => getField<String>('autoendgamerobotpos');
  set autoendgamerobotpos(String? value) =>
      setField<String>('autoendgamerobotpos', value);

  String? get teleopendgamerobotpos =>
      getField<String>('teleopendgamerobotpos');
  set teleopendgamerobotpos(String? value) =>
      setField<String>('teleopendgamerobotpos', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  int? get eventid => getField<int>('eventid');
  set eventid(int? value) => setField<int>('eventid', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);

  int? get autosamplenet => getField<int>('autosamplenet');
  set autosamplenet(int? value) => setField<int>('autosamplenet', value);

  int? get teleopsamplenet => getField<int>('teleopsamplenet');
  set teleopsamplenet(int? value) => setField<int>('teleopsamplenet', value);

  int? get autohighbusketsample => getField<int>('autohighbusketsample');
  set autohighbusketsample(int? value) =>
      setField<int>('autohighbusketsample', value);

  int? get autolowbusketsample => getField<int>('autolowbusketsample');
  set autolowbusketsample(int? value) =>
      setField<int>('autolowbusketsample', value);

  int? get autohighchemberspec => getField<int>('autohighchemberspec');
  set autohighchemberspec(int? value) =>
      setField<int>('autohighchemberspec', value);

  int? get autolowchemberspec => getField<int>('autolowchemberspec');
  set autolowchemberspec(int? value) =>
      setField<int>('autolowchemberspec', value);

  int? get teleophighbusketsample => getField<int>('teleophighbusketsample');
  set teleophighbusketsample(int? value) =>
      setField<int>('teleophighbusketsample', value);

  int? get teleoplowbusketsample => getField<int>('teleoplowbusketsample');
  set teleoplowbusketsample(int? value) =>
      setField<int>('teleoplowbusketsample', value);

  int? get teleophighchemberspec => getField<int>('teleophighchemberspec');
  set teleophighchemberspec(int? value) =>
      setField<int>('teleophighchemberspec', value);

  int? get teleoplowchemberspec => getField<int>('teleoplowchemberspec');
  set teleoplowchemberspec(int? value) =>
      setField<int>('teleoplowchemberspec', value);

  int? get autototal => getField<int>('autototal');
  set autototal(int? value) => setField<int>('autototal', value);

  int? get teleoptotal => getField<int>('teleoptotal');
  set teleoptotal(int? value) => setField<int>('teleoptotal', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
