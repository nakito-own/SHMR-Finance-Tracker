abstract class TransactionEvent {
  const TransactionEvent();
}

class LoadTransactionsByPeriod extends TransactionEvent {
  final int accountId;
  final DateTime start;
  final DateTime end;

  const LoadTransactionsByPeriod({
    required this.accountId,
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoadTransactionsByPeriod &&
              runtimeType == other.runtimeType &&
              accountId == other.accountId &&
              start == other.start &&
              end == other.end;

  @override
  int get hashCode => Object.hash(accountId, start, end);
}
