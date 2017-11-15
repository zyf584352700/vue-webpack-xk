import axios from 'axios'
import Vue from 'vue'
Vue.use(axios);

export default {
	state:{
		students:[]
	},
	getters:{
		students:state=>state.students
	},
	mutations:{
		alterStudent(state,data){
			state.students = data;
		}
	},
	actions:{
		findAllStudent(context){
			axios.get('http://127.0.0.1:3000/student/findAll').then(({data})=>{
				context.commit('alterStudent',data);
			});
		},
		saveStudent(context,form){
			return new Promise(function(resolve,reject){
				axios.post('http://127.0.0.1:3000/student/save',form).then((result)=>{
					context.dispatch('findAllStudent');
					resolve(result);
				}).catch((error)=>{
					reject(error);
				});
			});
		},
		batchDelete(context,id){
			return new Promise(function(resolve,reject){
				axios.post('http://127.0.0.1:3000/student/batchDelete',{id:id}).then((result)=>{
					context.dispatch('findAllStudent');
					resolve(result);
				}).catch((error)=>{
					reject(error);
				});
			});
		},
		updateStudent(context,form){
			return new Promise(function(resolve,reject){
				axios.post('http://127.0.0.1:3000/student/update',form).then((result)=>{
					context.dispatch('findAllStudent');
					resolve(result);
				}).catch((error)=>{
					reject(error);
				});
			});
		},
		toSearch:(context,keys)=>{
			return new Promise(function(resolve,reject){
				axios.get('http://127.0.0.1:3000/student/query/'+keys).then(function({data}){
					//console.log(data);
					resolve(data);
					context.commit('alterStudent',data);
				}).catch(function(error){
					reject(error);
				});
			});
		}
	}
}