/**
Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

Example:
For num = 5 you should return [0,1,1,2,1,2].

Follow up:

  It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
  Space complexity should be O(n).
    Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
      Show Hint 


 *  * @param {number} num
 *   * @return {number[]}
 *    */
var countBits = function(num) {
  if(num == 0) return [0];
  var counts = [];
  var last_count = 0;
  for(var i=0; i <= num; i++){
    if(i > 0){
      var andResult = i & (i - 1);
      var xorResult = i ^ (i - 1);
      if(xorResult == 1)
        last_count++;
      else if(andResult == 0)
        last_count = 1;
      else if(xorResult > 4){
        var oneMask = Math.pow(2,Math.floor(Math.log(xorResult) / Math.log(2)) + 1) - 1; 
        if(xorResult ^ oneMask == xorResult) last_count = last_count - Math.floor(Math.log(xorResult) / Math.log(2)) + 1;
      } 
    }
    counts.push(last_count);
  }
  return counts;
};
