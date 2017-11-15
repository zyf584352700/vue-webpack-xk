import axios from 'axios'
import vue from 'vue'

vue.use(axios);
axios.defaults.baseURL='http://127.0.0.1:3000';
export default {
	state:{
		classes:[]
	},
	getters:{
	    classes:(state)=>{
	    	return state.classes
	    }
	},
	mutations:{
		alterClasses:(state,val)=>{
			state.classes=val;
		}
	},
	actions:{
		findAllClass:(context)=>{
			axios.get('/clazz/findAll').then(function({data}){
				context.commit('alterClasses',data);
			});
		},
		batchDeleteClass:(context,id)=>{
			return new Promise(function(resolve,reject){
				axios.post('/clazz/batchDelete',{id:id}).then(function(result){
					console.log(result);
					context.dispatch('findAllClass');
					resolve(result);
				}).catch(function(error){
					reject(error);
				});
			});
		},
		updateClass:(context,data)=>{
			return new Promise(function(resolve,reject){
				axios.post('/clazz/update',data).then(function(result){
					context.dispatch('findAllClass');
					resolve(result);
				}).catch(function(error){
					reject(error);
				});
			});
		},
		saveClass:(context,data)=>{
			return new Promise(function(resolve,reject){
				axios.post('/clazz/save',data).then(function(result){
					context.dispatch('findAllClass');
					resolve(result);
				}).catch(function(error){
					reject(error);
				});
			});
		},
		toSearch:(context,keys)=>{
			return new Promise(function(resolve,reject){
				axios.get('/clazz/query/'+keys).then(function({data}){
					resolve(data);
					context.commit('alterClasses',data);
				}).catch(function(error){
					reject(error);
				});
			});
		}
	}
}