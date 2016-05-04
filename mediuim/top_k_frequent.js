var Bucket = function(size){
    this.data = [];
    this._size = size;
    this.sorted_insert = function(num, count){
        var m = 0;
        for(; m < this.data.length; m++){
            if(this.data[m].count > count){
                this._insert(m, num, count);
                break;
            }
        }
        if(m == this.data.length) this._insert(m, num, count);
    };
    this._insert = function(index, num, count){
        this.data.splice(index, 0, {num: num, count: count});
        if(this._size < this.data.length) this.data.shift();
    };
    
}

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function(nums, k) {
    var countHash = {};
    for(var i = 0; i < nums.length; i++){
        var num = nums[i];
        if(!countHash[num])
            countHash[num] = 1;
        else
            countHash[num]++;
    }
    var kBucket = new Bucket(k);
    countHashKeys = Object.keys(countHash);
    for(var j = 0; j < countHashKeys.length; j++){
        var key = countHashKeys[j];
        var count = countHash[key];
        kBucket.sorted_insert(key, count);
    }
    return kBucket.data.map(function(item){ return Number(item.num); })
};
