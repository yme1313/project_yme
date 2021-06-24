function rollingTop(list, listItem, marginTop, animateTime, intervalTime){
  var id = setInterval(function(){
     if(!$(list + ' ' + listItem).first().is(':animated')){
     $(list + ' ' + listItem).first()
     .animate({'margin-top' : marginTop +'px'},animateTime,function(){
     $(this).detach().appendTo(list).removeAttr('style')
      });
    };
   },intervalTime);
   return id;
 }

 function rollingLeft(list, listItem ,marginLeft, animateTime, intervalTime){
  var id = setInterval(function(){
    if(!$(list + ' ' + listItem).first().is(':animated')){
    $(list + ' ' + listItem).first()
    .animate({'margin-left': marginLeft + 'px'},animateTime,function(){
      $(this).detach().appendTo(list).removeAttr('style')
    });
    };
  },intervalTime);
  return id;
};
