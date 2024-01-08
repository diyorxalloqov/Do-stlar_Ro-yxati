import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_list/db/sql_dbService.dart';
import 'package:meta/meta.dart';

import 'package:friends_list/model/friends_model.dart';
import 'package:friends_list/utils/enum/status.dart';
import 'package:sqflite/sqflite.dart';

part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final SqlDbService _sqldbService = SqlDbService();

  FriendsBloc() : super(const FriendsState()) {
    on<FriendsGetEvent>(_getAllFriends);
    add(FriendsGetEvent());
    on<FriendsCreateEvent>(_createFriend);
    on<FriendsUpdateEvent>(_updateFriend);
    on<FriendsDeleteEvent>(_deleteFriend);
  }

  FutureOr<void> _getAllFriends(
      FriendsGetEvent event, Emitter<FriendsState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    try {
      var response = await _sqldbService.getALlData();
      emit(state.copyWith(status: ActionStatus.isSuccess, friends: response));
    } on DatabaseException catch (e) {
      emit(state.copyWith(status: ActionStatus.isError, error: e.toString()));
    }
  }

  FutureOr<void> _createFriend(
      FriendsCreateEvent event, Emitter<FriendsState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    try {
      await _sqldbService.insertData(event.friendsCreate);
      emit(state.copyWith(status: ActionStatus.isSuccess));
      add(FriendsGetEvent());
    } on DatabaseException catch (e) {
      emit(state.copyWith(status: ActionStatus.isError, error: e.toString()));
    }
  }

  FutureOr<void> _updateFriend(
      FriendsUpdateEvent event, Emitter<FriendsState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    try {
      await _sqldbService.updateData(event.taskmodelnew);
      emit(state.copyWith(status: ActionStatus.isSuccess));
      add(FriendsGetEvent());
    } on DatabaseException catch (e) {
      emit(state.copyWith(status: ActionStatus.isError, error: e.toString()));
    }
  }

  FutureOr<void> _deleteFriend(
      FriendsDeleteEvent event, Emitter<FriendsState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    try {
      await _sqldbService.deleteData(event.id);
      emit(state.copyWith(status: ActionStatus.isSuccess));
      add(FriendsGetEvent());
    } on DatabaseException catch (e) {
      emit(state.copyWith(status: ActionStatus.isError, error: e.toString()));
    }
  }
}
