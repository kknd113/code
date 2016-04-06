var majorityElement = function(nums) {
    var buckets = [];
    var size = nums.length;
    if(size == 0) return [];
    if(size < 3) return Array.from(new Set(nums));

    for(var i=0; i < size; i++){
        var num = nums[i];
        if(!buckets[0]){
            buckets[0] = { number: num, count: 1 };
        }
        else{
            if(buckets[0].number === num) buckets[0].count++;
            else {
              if(!buckets[1]) buckets[1] = { number:num, count:1 };
              else if(buckets[1].number === num) buckets[1].count++;
              else{
                if(buckets[0].count === 0)
                  buckets[0] = {number: num, count: 1 };
                else if(buckets[1].count === 0)
                  buckets[1] = {number: num, count: 1 };
                else{
                  buckets[0].count--;
                  buckets[1].count--;
                }
              }
            }
        }
    }

    return buckets
             .map(function(b){ return b.number; })
	     .filter(function(n){
               var numberCount = 0;
	       for(var j=0; j<size; j++){
                 if(n === nums[j]) numberCount++;
               }
	       return numberCount > size/3.0;
	     });
}
