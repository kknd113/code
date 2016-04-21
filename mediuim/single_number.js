/**

Given an array of integers, every element appears twice except for one. Find that single one.

Note:
Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?


 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
    if(!nums) return null;
    if(nums.length == 1) return nums[0];
    if(nums.length == 2) return null;
    var num;
    while(nums.length > 0){
        if(!num)
            num  = nums.pop();
        else
            num = num  ^ nums.pop();
    }
    return num;
};
