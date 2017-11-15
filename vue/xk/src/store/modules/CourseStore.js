import axios from 'axios'
import vue from 'vue'

vue.use(axios);
axios.defaults.baseURL='http://127.0.0.1:3000';
export default {
	state:{
		courses:[]
	},
	getters:{
	    courses:(state)=>{
	    	return state.courses
	    }
	},
	mutations:{
		alterCourses:(state,val)=>{
			state.courses = val;
		}
	},
	actions:{
		findAllCourse:(context)=>{
			axios.get('/course/findAll').then(function({data}){
				context.commit('alterCourses',data);
			});
		},
		batchDeleteCourse:(context,id)=>{
			return new Promise(function(resolve,reject){
				axios.post('/course/batchDelete',{id:id}).then(function(result){
					context.dispatch('findAllCourse');
					resolve(result);
				}).catch(function(error){
					reject(error);
				});
			});
		},
		updateCourse:(context,data)=>{
			return new Promise(function(resolve,reject){
				axios.post('/course/update',data).then(function(result){
					context.dispatch('findAllCourse');
					resolve(result);
				}).catch(function(error){
					reject(error);
				});
			});
		},
		saveCourse:(context,data)=>{
			return new Promise(function(resolve,reject){
				//console.log(data.name);
				axios.post('/course/save',data).then(function(result){
					context.dispatch('findAllCourse');
					resolve(result);
				}).catch(function(error){
					reject(error);
				});
			});
		},
		toSearch:(context,keys)=>{
			return new Promise(function(resolve,reject){
				axios.get('/course/query/'+keys).then(function({data}){
					//console.log(data);
					resolve(data);
					context.commit('alterCourses',data);
				}).catch(function(error){
					reject(error);
				});
			});
		}
	}
}