<script>
	import ExperienceCard from './ExperienceCard.svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';
	import IconBrain from '~icons/lucide/brain' 

</script>

<h1
	class="top-0 m-10 w-fit rounded-full border-2 border-sky-400 bg-gray-950 p-4 text-4xl text-yellow-200"
>
	Experience
</h1>

<div class="flex flex-col gap-20">
	<ExperienceCard Icon={IconGraduationCap}>
		<h1 class="text-3xl mb-2">B.A. in Computer Science</h1>
		<h2 class="border-1 w-fit px-2 text-green-300 bg-green-300/10 rounded-full mb-2">Lewis & Clark College</h2>
		<p class="text-lg font-electrolize text-sky-600">
			This is a placeholder paragraph. It doesn't have anything here yet. We need to make sure
			that all the things are the same size. That will happen later
		</p>
	</ExperienceCard>
	<ExperienceCard Icon={IconBrain}>
		<h1 class="text-3xl mb-2">BCI Programmer</h1>
		<h2 class="border-1 w-fit px-2 text-green-300 bg-green-300/10 rounded-full mb-2">Oregon Health & Science University</h2>
		<p class="text-lg font-electrolize text-sky-600">
			This is a placeholder paragraph. It doesn't have anything here yet. We need to make sure
			that all the things are the same size. That will happen later
		</p>
	</ExperienceCard>
</div>