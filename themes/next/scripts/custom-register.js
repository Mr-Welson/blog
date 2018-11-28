/* 自定义 hexo 脚本 */

hexo.extend.helper.register('is_mobile', function(){
  // 此处无法访问 window 对象
  return true
});