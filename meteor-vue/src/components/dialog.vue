<template>
  <div class="dialog"
    v-show="show"
    transition="dialog-fade" id="popdialogid">
    <div class="dialog-content">
      <slot>

      </slot>
    </div>
  </div>
</template>

<style>
  .dialog {
    left: 50%;
    top: 20%;
    transform: translate(-50%, -50%);
    position: fixed;
    width: 40%;
  }

  .dialog-content {
    background: url(../../static/img/body/landscape.jpg);
    border-radius: 8px;
    padding: 20px;
    text-align: center;
  }

  .dialog-fade-transition {
    transition: opacity .3s linear;
  }

  .dialog-fade-enter,
  .dialog-fade-leave {
    opacity: 0.8;
  }
</style>

<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script>
import Popup from '../modules/pop'

export default {
  mixins: [Popup],
  props: ['show'],
  data () {
    return {
      newshow: this.show
    }
  },
  methods: {
    // 响应 overlay事件
    overlayClick () {
      this.newshow = false
    },
    // 响应 esc 按键事件
    escPress () {
      this.newshow = false
    }
  },
  watch: {
    show(val){this.newshow=val},
    newshow() {this.$emit('modifydata', this.newshow)}
  }
}


</script>
