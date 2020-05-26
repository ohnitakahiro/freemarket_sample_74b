$(document).on('turbolinks:load',(function(){
  $(function(){
    var index = [1,2,3,4,5,6,7,8,9,10];
    var loc = location.pathname;
    // 入力フォームの変形
    
    // 新規出品
    if( loc.indexOf("new") != -1){
      // デリート機能
      $(".flexbox").on("click", ".delete-btn", function(){
        var targetIndex = Number($(this).attr("index"));
        index.push(targetIndex);

        if($(this).parent().parent().attr("class") == "new-wrapper__main__preview-first"){
          $(".new-wrapper__main__preview .new-wrapper__main__preview__image:first").appendTo(".new-wrapper__main__preview-first");
        }
        if(index.length > 5){
          $(".new-wrapper__main__image-field").css("width",(index.length-5)*124);
        }else if(index.length == 5){
          $("#image-field-second").remove();
          $(".new-wrapper__main__preview").remove();
          $(".new-wrapper__main__preview-first").attr("class", "new-wrapper__main__preview");
          $(".new-wrapper__main__image-field").css("display","flex");
        }else if(index.length == 0){
          $("#image-field-second").css("display","flex");
          $("#image-field-second").css("width",index.length*124);
        }else{
          $("#image-field-second").css("width",index.length*124);
        }
        $("#image-wrapper").attr("for",`item_images_attributes_${targetIndex}_image`);
        $(this).parent().remove();
        $(`#item_images_attributes_${targetIndex}_image`).remove();
        $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${targetIndex}][image]" id="item_images_attributes_${targetIndex}_image">`);
      })
      var buildImage = function(url){
        if(index.length != 0){
          $(".new-wrapper__main__preview").append(`
            <div class="new-wrapper__main__preview__image">
            <img class="new-wrapper__main__preview__image__img" src="${url}">
            <div class="delete-btn" index=${index[0]}><i class="far fa-times-circle"></i></div>
          `);
          $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${index[1]}][image]" id="item_images_attributes_${index[1]}_image">`);
          $("#image-wrapper").attr("for",`item_images_attributes_${index[1]}_image`);
          index.shift();
          if(index.length > 5){
            $("#image-field-second").remove();
            $(".new-wrapper__main__image-field").css("display","flex");
            $(".new-wrapper__main__image-field").css("width",(index.length-5)*124);
          }else if(index.length == 5){
            $(".new-wrapper__main__image-field").css("display","none");
            $("#image-wrapper").append(`
              <div class="new-wrapper__main__image-field" id="image-field-second">
                <i class="fas fa-camera"></i>
                <div class="new-wrapper__main__image-field__text">
                  ドラッグアンドドロップ
                  <br>
                  またはクリックしてファイルをアップロード
                </div>
              </div>
            `);
            $(".new-wrapper__main__preview").attr("class", "new-wrapper__main__preview-first");
            $(".new-wrapper__main__preview-first").after(`<div class="new-wrapper__main__preview"></div>`);
          }else if(index.length == 0){
            $("#image-field-second").css("display","none");
          }
          $("#image-field-second").css("width",index.length*124);
        }
      }
      // プレビューを表示する
      $(".flexbox").on("change", function(e){
        var blob = window.URL.createObjectURL(e.target.files[0]);
        buildImage(blob);
      })
    }

    // 編集機能
    if( loc.indexOf("edit") != -1){
      //  .new-wrapper__main__previewの子要素の数を取得する
      // 要素を取得
      var element = document.getElementsByClassName("new-wrapper__main__preview__image__img");
      var element_length = element.length;

      // 登録されている画像を表示
      if(element_length <= 5){
        $(".new-wrapper__main__image-field").css("width",(5 - element_length) *124);
      }else if(element_length == 10){
        $(".new-wrapper__main__image-field").css("display","none");
      }else{
        $(".new-wrapper__main__image-field").css("width",124);
      }     
      index.shift();
      // 既に使われているindexの削除
      lastIndex = $('.new-wrapper__main__preview__image__img:last').data('index');
      index.splice(0, lastIndex - 1);
      $('.hidden-destroy').hide();

      // 追加機能
      var buildImage = function(url){
        if(index.length != 0){
          $(".new-wrapper__main__preview").append(`
            <div class="new-wrapper__main__preview__image" data-index= "${index[0]}">
            <img class="new-wrapper__main__preview__image__img" src="${url}">
            <div class="delete-btn" index=${index[0]}><i class="far fa-times-circle"></i></div>
          `);
          $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${index[1]}][image]" id="item_images_attributes_${index[1]}_image">`);
          $("#image-wrapper").attr("for",`item_images_attributes_${index[1]}_image`);
          index.shift();
          if(index.length > 5 ){
            $(".new-wrapper__main__image-field").css("width",(index.length - 5)*124);
          }else if(index.length == 10){
            $(".new-wrapper__main__image-field").css("display","flex");
            $(".new-wrapper__main__image-field").css("width",620);
          }else if(index.length == 0){
            $(".new-wrapper__main__image-field").css("display","none");
          }else{
            $(".new-wrapper__main__image-field").css("display","flex");
            $(".new-wrapper__main__image-field").css("width",124);
          }
        }
      }


      // 削除機能
      $(".flexbox").on("click", ".delete-btn", function(){
        const targetIndex = $(this).parent().data('index')
        // 該当indexを振られているチェックボックスを取得する
        const hiddenCheck = $(`input[data-index="${targetIndex - 1}"].hidden-destroy`);
        // もしチェックボックスが存在すればチェックを入れる
        if (hiddenCheck) hiddenCheck.prop('checked', true);
        index.push(targetIndex);
        if($(this).parent().parent().attr("class") == "new-wrapper__main__preview-first"){
          $(".new-wrapper__main__preview .new-wrapper__main__preview__image:first").appendTo(".new-wrapper__main__preview-first");
        }
        if(index.length > 5 ){
          $(".new-wrapper__main__image-field").css("width",(index.length - 5)*124);
        }else if(index.length == 10){
          $(".new-wrapper__main__image-field").css("display","flex");
          $(".new-wrapper__main__image-field").css("width",620);
        }else if(index.length == 0){
          $(".new-wrapper__main__image-field").css("display","none");
        }else{
          $(".new-wrapper__main__image-field").css("display","flex");
          $(".new-wrapper__main__image-field").css("width",124);
        }
        $("#image-wrapper").attr("for",`item_images_attributes_${targetIndex}_image`);
        $(this).parent().remove();
        $(`#item_images_attributes_${targetIndex}_image`).remove();
        $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${targetIndex}][image]" id="item_images_attributes_${targetIndex}_image">`);
      })
   
      // プレビューを表示する
      $(".flexbox").on("change", function(e){
        var blob = window.URL.createObjectURL(e.target.files[0]);
        buildImage(blob);
      })

    }
  })
}))