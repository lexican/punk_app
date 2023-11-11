String convertToIdHash(num id) {
  assert(id >= 0, 'ID should be greater than or equal to 0');
  return "#${'$id'.padLeft(3, '0')}";
}
