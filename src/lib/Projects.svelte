<script>
	import ProjectCard from './ProjectCard.svelte';
	import testImage from '$lib/assets/path_tracer_placeholder.png';
</script>

<h1 class="m-10 text-center text-4xl">Some things I've made</h1>
<div class="my-15 flex w-full justify-center">
	<ProjectCard
		image={testImage}
        imageAlt="test alt"
		title={'Project Title'}
		description={'This is a whole paragraph. It has a lot of very very interesting things about this project that I worked on'}
	/>
</div>
