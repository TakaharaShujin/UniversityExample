angular.module('bilkent', ['ui.router'])
.config [
	'$stateProvider'
	'$urlRouterProvider'
	($stateProvider, $urlRouterProvider) ->
		$stateProvider
		.state 'index',
			url: '/'
			templateUrl: 'pages/index.html'
		.state 'academic-staff-list',
			url: '/akademik-personel'
			templateUrl: 'pages/academic-staff-list.html'
		.state 'academic-staff',
			url: '/akademik-personel/:slug'
			templateUrl: 'pages/academic-staff.html'
			controller: 'AcademicController'
		$urlRouterProvider.otherwise '/'
		return
]
.controller 'SearchController', [
	'$scope'
	'StaffModel'
	'$rootScope'
	($scope, StaffModel, $rootScope) ->
		$scope.stafflist = StaffModel.all()
		$rootScope.$on '$stateChangeStart', ->
			$scope.keyword = name: ""
]
.controller 'AcademicController', [
	'$scope'
	'$stateParams'
	'StaffModel'
	($scope, $stateParams, StaffModel) ->
		$scope.singleStaff = StaffModel.get($stateParams.slug)
]
.factory 'StaffModel', ->
	staff = [
		{
			id 		:0
			name	:'Y. Doç. Marek Brzozowski'
			info	:'Sanatta Yüksek Diploma, Grafik Tasarım ve Tipografi, Gdansk Güzel Sanatlar Akademisi, 1978.'
			office	:'FB-205'
			phone	:'290 1739'
			email	:'marek@bilkent.edu.tr'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/marekb.jpg'
			slug 	:'marek-brzozowski'
		}
		{
			id 		:1
			name	:'Adam Pekalski'
			info	:'Sanatta Yüksek Diploma, Grafik Tasarım ve İllüstrasyon, Gdansk Güzel Sanatlar Akademisi, 2000. '
			office	:'FB-204'
			phone	:'290 1448'
			email	:'pekalski@bilkent.edu.tr'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/adamp.jpg'
			slug 	:'adam-pekalski'
		}
		{
			id 		:2
			name	:'Atıl Kurttekin '
			info	:'B.F.A., Grafik Tasarım, Bilkent Üniversitesi, 1997.'
			office	:'FB-307'
			phone	:'290 1745'
			email	:'atilk@bilkent.edu.tr '
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/atilk.jpg'
			slug 	:'atil-kurttekin'
		}
		{
			id 		:3
			name	:'Cengiz Gürer'
			info	:'B.F.A., Grafik Sanatlar, İstanbul Uygulamalı Sanatlar Okulu (D.T.G.S.Y.O.), 1978.'
			office	:'FB-Z07'
			phone	:'290 1741'
			email	:'cgurer@bilkent.edu.tr'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/cengizg.jpg'
			slug 	:'cengiz-gurer'
		}
		{
			id 		:4
			name	:'Ekin Kılıç'
			info	:'Sanatta Yeterlik, Hacettepe Üniversitesi, Güzel Sanatlar Fakültesi, Grafik Bölümü, 2011.'
			office	:'FBZ-05'
			phone	:'290 2734'
			email	:'ekinklch@gmail.com'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/ekink.jpg'
			slug 	:'ekin-kilic'
		}
		{
			id 		:5
			name	:'Fulya İnce'
			info	:'M.F.A., Grafik Tasarım, Eastern Michigan University, 1995.'
			office	:'FB-308'
			phone	:'290 1763'
			email	:'fince@bilkent.edu.tr'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/fulyai.jpg'
			slug 	:'fulya-ince'
		}
		{
			id 		:6
			name	:'Murad Gürzumar'
			info	:'B.A., Klasik Arkeoloji Ankara Üniversitesi, 1985.'
			office	:'FB-208'
			phone	:'290 1661'
			email	:'gmurat@bilkent.edu.tr'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/muradg.jpg'
			slug 	:'murad-gurzumar'
		}
		{
			id 		:7
			name	:'Can Birand'
			info	:'M.F.A., Grafik Tasarım, Virginia Common Wealth University, 2008.'
			office	:'FB-306'
			phone	:'290 1740'
			email	:'canbirand@gmail.com / canbirand@bilkent.edu.tr'
			face	:'http://www.gra.bilkent.edu.tr/src/images/people/canb.jpg'
			slug 	:'can-birand'
		}
	]
	return {
		all: ->
			staff
		remove: (slug) ->
			staff.splice staff.indexOf(slug), 1
			return
		get: (slug) ->
			i = 0
			while i < staff.length
				if staff[i].slug is slug
					return staff[i]
				i++
	}