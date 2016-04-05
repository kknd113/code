/**
 * You are playing the following Nim Game with your friend: There is a heap of stones on the table, each time one of you take turns to remove 1 to 3 stones. The one who removes the last stone will be the winner. You will take the first turn to remove the stones.
 *
 * Both of you are very clever and have optimal strategies for the game. Write a function to determine whether you can win the game given the number of stones in the heap.
 *
* For example, if there are 4 stones in the heap, then you will never win the game: no matter 1, 2, or 3 stones you remove, the last stone will always be removed by your friend.
 *  * @param {number} n
 *   * @return {boolean}
 *    */
var canWinNim = function(n) {
  if(n < 4) return true;
  if(n == 4) return false;

  var queue = [];
  var cache = {};
  queue.push(
    {num: n-3, level: 2}, 
    {num: n-2, level: 2}, 
    {num: n-1, level: 2} 
  );
  while(queue.length > 0){
    cur = queue.splice(0,1)[0];
    if(cur.level % 2 == 1 && cur.num <= 3) return true;
    else if(!cache[cur.num + '_' + cur.level]){
      for(var i=3; i > 0; i--){
        if(cur.num - i > 0) {
          queue.push({
            num: cur.num - i,
            level: cur.level + 1
          });
        }
      }
      cache[cur.num + '_' + cur.level] = true
    }
  }
  return false;
};
