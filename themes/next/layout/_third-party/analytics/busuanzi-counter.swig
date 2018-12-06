{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {# 本站访客数 #}
  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv" id="busuanzi_container_site_uv">
      {{ theme.busuanzi_count.site_uv_header }}
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
      {{ theme.busuanzi_count.site_uv_footer }}
    </span>
  {% endif %}

  {# 本站总访问量 #}
  {% if theme.busuanzi_count.site_pv %}
    <span class="site-pv" id="busuanzi_container_site_pv">
      {{ theme.busuanzi_count.site_pv_header }}
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
      {{ theme.busuanzi_count.site_pv_footer }}
    </span>
  {% endif %}
</div>
{% endif %}
