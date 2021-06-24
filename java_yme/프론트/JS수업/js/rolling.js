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

 function rollingLeft(list, listItem, animateTime, intervalTime){
  var id = setInterval(function(){
  if($(list +' ' + listItem).first()){
    var width = $(list +' ' + listItem).first().width();
    $(list +' ' + listItem).first()
      .animate({'margin-left':'-'+width}, animateTime,function(){
      $(this).detach().appendTo(list).removeAttr('style');
    })
  }
},intervalTime);
return id;
};

function rollingRight(list, listItem, animateTime, intervalTime){
  var id = setInterval(function(){
    var width = $(list + ' ' +listItem).last().width();
    if(!$(list + ' ' +listItem).first().is('animated')){
    $(list + ' ' +listItem).last().detach().prependTo(list)
    .css('margin-left', -width + 'px')
      $(list + ' ' +listItem).animate({'margin-left': '0px'},animateTime)
    }
  },intervalTime);
  return id;
}