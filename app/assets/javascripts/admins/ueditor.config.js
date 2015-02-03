$(function(){
    var URL = window.UEDITOR_HOME_URL = "/assets/admins/";
    window.CUSTOM_CONFIG = {
      UEDITOR_HOME_URL: URL,
      imageUrl: "/admins/site/upload",
      imagePath: "",
      savePath: ['upload','upload1'],
      method: "post",
      imageFieldName:"img" ,
      elementPathEnabled: false,
      wordCount:0 ,
      maximumWords:5000,
      pasteplain:true,
      zIndex: 0,
      contextMenu: [],
      initialFrameHeight:300,
        toolbars: [
          [ 'bold', 'insertimage','link','unlink','source']
        ]
  };
  jQuery.extend(window.UEDITOR_CONFIG, window.CUSTOM_CONFIG);

  var ue = UE.getEditor("content");

});