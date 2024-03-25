// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:note_app/data/data_source/note_db_helper.dart' as _i4;
import 'package:note_app/data/repository/note_repository_impl.dart' as _i7;
import 'package:note_app/di/app_module.dart' as _i16;
import 'package:note_app/domain/repository/note_repository.dart' as _i6;
import 'package:note_app/domain/use_case/add_note.dart' as _i10;
import 'package:note_app/domain/use_case/delete_note.dart' as _i11;
import 'package:note_app/domain/use_case/get_note.dart' as _i12;
import 'package:note_app/domain/use_case/get_notes.dart' as _i13;
import 'package:note_app/domain/use_case/update_note.dart' as _i8;
import 'package:note_app/domain/use_case/use_cases.dart' as _i14;
import 'package:note_app/presentation/add_edit_note/add_edit_note_view_model.dart'
    as _i9;
import 'package:note_app/presentation/notes/notes_view_model.dart' as _i15;
import 'package:sqflite/sqflite.dart' as _i3;
import 'package:sqflite/sqlite_api.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.Database>(
      () => appModule.db,
      preResolve: true,
    );
    gh.singleton<_i4.NoteDBHelper>(_i4.NoteDBHelper(gh<_i5.Database>()));
    gh.singleton<_i6.NoteRepository>(
        _i7.NoteRepositoryImpl(gh<_i4.NoteDBHelper>()));
    gh.singleton<_i8.UpdateNoteUseCase>(
        _i8.UpdateNoteUseCase(gh<_i6.NoteRepository>()));
    gh.factory<_i9.AddEditNoteViewModel>(
        () => _i9.AddEditNoteViewModel(gh<_i6.NoteRepository>()));
    gh.singleton<_i10.AddNoteUseCase>(
        _i10.AddNoteUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i11.DeleteNoteUseCase>(
        _i11.DeleteNoteUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i12.GetNoteUseCase>(
        _i12.GetNoteUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i13.GetNotesUseCase>(
        _i13.GetNotesUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i14.UseCases>(_i14.UseCases(
      addNote: gh<_i10.AddNoteUseCase>(),
      deleteNote: gh<_i11.DeleteNoteUseCase>(),
      getNotes: gh<_i13.GetNotesUseCase>(),
      getNote: gh<_i12.GetNoteUseCase>(),
      updateNote: gh<_i8.UpdateNoteUseCase>(),
    ));
    gh.factory<_i15.NotesViewModel>(
        () => _i15.NotesViewModel(useCases: gh<_i14.UseCases>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
