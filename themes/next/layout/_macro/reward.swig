
{# 打赏模板 theme.reward_comment #}

<div id="reward-block">
  <button id="rewardButton" disable="enable">
    <span>{{ __('reward.donate') }}</span>
  </button>
  <div class="reward-comment">{{ theme.reward_comment }}</div>
  <div id="QR" data-show="false">

    {% if theme.wechatpay %}
      <div id="wechat" class="reward-box" style="display: inline-block">
        <img id="wechat_qr" src="{{ theme.wechatpay }}" alt="{{ theme.author }} {{ __('reward.wechatpay') }}"/>
        <p>{{ __('reward.wechatpay') }}</p>
      </div>
    {% endif %}

    {% if theme.alipay %}
      <div id="alipay" class="reward-box" style="display: inline-block">
        <img id="alipay_qr" src="{{ theme.alipay }}" alt="{{ theme.author }} {{ __('reward.alipay') }}"/>
        <p>{{ __('reward.alipay') }}</p>
      </div>
    {% endif %}

    {% if theme.bitcoin %}
      <div id="bitcoin" class="reward-box" style="display: inline-block">
        <img id="bitcoin_qr" src="{{ theme.bitcoin }}" alt="{{ theme.author }} {{ __('reward.bitcoin') }}"/>
        <p>{{ __('reward.bitcoin') }}</p>
      </div>
    {% endif %}

  </div>

  {% if theme.wechatpay || theme.alipay || theme.bitcoin %}
    <script type="text/javascript">
      document.getElementById("rewardButton").onclick = function() {
          var $QR = document.getElementById("QR");
          console.log(222)
          if($QR.dataset.show === "false") {
            $QR.dataset.show = "true";
            $QR.style.height = "280px";
          } else {
            $QR.dataset.show = "false";
            $QR.style.height = "0px";
          }
      }
    </script>
  {% endif %}
</div>
