enum Status{
  ACTIVE,
  PENDING,
  SUSPENDED
}
Map<num,Status> statusMap={
  0:Status.PENDING,
  1:Status.ACTIVE,
  2:Status.SUSPENDED
};
Status getStatus(num status)=>statusMap[status]!;