<template>
  <section id="main" class="" role="main">
      <bodyheader></bodyheader>
      <sidebar></sidebar>
      <section id="content" class="container">
          <info></info>
          <warn></warn>
      </section>
  </section>
</template>

<script>
  import sidebar from './sidebar.vue'
  import bodyheader from './bodyheader.vue'
  import info from './info.vue'
  import warn from './warn.vue'
export default {
    components: {
      sidebar, bodyheader, info, warn
    }
}
</script>

