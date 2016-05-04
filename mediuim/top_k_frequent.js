var Bucket = function(size){
    this.data = [];
    this._size = size;
    
    this.sorted_insert = function(num, count){
        var index = this._search_for_position(count);
        this._insert(index, num, count);
    };
    
    this._insert = function(index, num, count){
        this.data.splice(index, 0, {num: num, count: count});
        if(this._size < this.data.length) this.data.pop();
    };
    
    this._search_for_position = function(count){
        if(this.data.length === 0) return 0;
        if(count >= this.data[0].count) return 0;
        if(count <= this.data[this.data.length - 1].count) return this.data.length;
        
        var middle = Math.floor(this.data.length / 2);
        var start = 0;
        var last = this.data.length - 1;
        
        while(count > this.data[middle].count || count < this.data[middle+1].count){
            if(last == start){
                if(count < this.data[start].count)
                    return start + 1;
                else
                    return start;
            }
            else if(last - start == 1){
                if(count <= this.data[start].count && count >= this.data[last].count)
                    return last;
                else if(count <= this.data[last].count) 
                    return last + 1;
                else
                    return start;
            }
            else {
                if(count < this.data[middle].count){
                    start = middle;
                    middle = Math.floor((start + last) / 2);
                 }
                else{
                    last = middle - 1;
                    middle = Math.floor((start + last) / 2);                
                }
            }
        }
        return middle + 1;
    }
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
