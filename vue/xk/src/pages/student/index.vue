<template>
	<div class="Student">
		<router-view></router-view>
	</div>
</template>
<script>
	export default {
		name:'Student',
		data(){
			return {
				msg:'hello ,this is student module'
			}
		}
	}
</script>
<style scoped>
	
</style>