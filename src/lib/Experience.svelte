<script>
	import ExperienceCard from './ExperienceCard.svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';

</script>

<h1
	class="top-0 m-10 w-fit rounded-full border-2 border-sky-400 bg-gray-950 p-4 text-4xl text-yellow-200"
>
	Experience
</h1>

<ExperienceCard Icon={IconGraduationCap}>
	<h1 class="text-3xl mb-2">This is a Placeholder</h1>
	<p class="text-lg font-electrolize">
		This is a placeholder paragraph. It doesn't have anything here yet. We need to make sure
		that all the things are the same size. That will happen later
	</p>
</ExperienceCard>
