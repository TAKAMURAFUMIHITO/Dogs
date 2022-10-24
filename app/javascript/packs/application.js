// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
/*global $*/

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import '@fortawesome/fontawesome-free/js/all';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

$(document).on('turbolinks:load', function() {
  $('#post_images').on('change',function(e){
    var files = e.target.files;
    var d = (new $.Deferred()).resolve();
    $.each(files,function(i,file){
      d = d.then(function(){return previewImage(file)});
    });
  });

  var previewImage = function(imageFile){
    var reader = new FileReader();
    var img = new Image();
    var def =$.Deferred();
    reader.onload = function(e){
      $('.images_field').append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  };
});

$(document).on('turbolinks:load', function() {
  $('.slicker').slick({
    autoplay: true, // 自動再生
    autoplaySpeed: 3000, // 再生速度（ミリ秒）
    dots: true // ドットの表示  （この行を追加）
  });
});

$(document).on('turbolinks:load', function() {
  $('.slicker_non_auto').slick({
    dots: true // ドットの表示  （この行を追加）
  });
});