import '../database.dart';

class EventslistTable extends SupabaseTable<EventslistRow> {
  @override
  String get tableName => 'eventslist';

  @override
  EventslistRow createRow(Map<String, dynamic> data) => EventslistRow(data);
}

class EventslistRow extends SupabaseDataRow {
  EventslistRow(super.data);

  @override
  SupabaseTable get table => EventslistTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get eventname => getField<String>('eventname');
  set eventname(String? value) => setField<String>('eventname', value);

  DateTime? get eventdate => getField<DateTime>('eventdate');
  set eventdate(DateTime? value) => setField<DateTime>('eventdate', value);

  String? get eventcode => getField<String>('eventcode');
  set eventcode(String? value) => setField<String>('eventcode', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
