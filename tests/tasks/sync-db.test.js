const { syncDb } = require("../../tasks/sync-db");

describe('Testing SyncDb', () => {
  test('Should run twice', () => {

    syncDb();
    const times = syncDb();

    expect(times).toBe(2);
  });
});