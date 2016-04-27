/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
    var shiftOffset = 0;
    for(var i = 0; i + shiftOffset < nums.length; i++){
        var num = nums[i + shiftOffset];
        while(num === 0){
            shiftOffset++;
            if(i + shiftOffset >= nums.length) break;
            num = nums[i + shiftOffset];
        }
        nums[i] = num;
        
    }

    for(; i < nums.length; i++){
        nums[i] = 0;
    }
};
