<template>
	<div class="StudentInfo">
		<el-row class="header">
			<el-col :span='6'>
				<el-input v-model="keywords" placeholder="请输入关键字" @change="querySearch"></el-input>
			</el-col>
			<el-col :span='18' class="saveOptions">
        <el-button plain @click="handleSingleSave">单个录入</el-button>
        <el-button plain>批量导入</el-button>
      </el-col>
		</el-row>
    <el-row>
      <el-col>
        <el-table
          class='table'
          :data="students"
          style="width: 100%">
          <el-table-column
            prop="name"
            label="姓名"
            >
          </el-table-column>
          <el-table-column
            prop="gender"
            label="性别"
            >
          </el-table-column>
          <el-table-column
            prop="birth"
            label="出生日期" :formatter="dateFormat">
          </el-table-column>
          <el-table-column
            prop="class.name"
            label="班级">
          </el-table-column>
          <el-table-column label="操作" width="180">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
              <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>

    <el-dialog :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="姓名">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio v-model="form.gender" label="男">男</el-radio>
          <el-radio v-model="form.gender" label="女">女</el-radio>
        </el-form-item>
        <el-form-item label="生日">
          <el-date-picker
            v-model="form.birth"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="班级">
          <el-select v-model="form.class_id" placeholder="请选择">
            <el-option
              v-for="item in classes"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="xuanze">确 定</el-button>
      </div>
    </el-dialog>
	</div>
</template>
<script>
  import moment from 'moment';
  import ElRow from "element-ui/packages/row/src/row";
  import ElCol from "element-ui/packages/col/src/col";
  import {mapGetters,mapActions} from 'vuex';
	export default {
    components: {
      ElCol,
      ElRow
    },
    name:'StudentInfo',
    computed:{
      ...mapGetters(['students','classes'])
    },
		data(){
			return {
        keywords:'',
        dialogFormVisible:false,
        form:{},
        title:''
			}
		},
    created(){
		  this.findAllStudent();
		  this.findAllClass();
    },
    methods:{
      querySearch:function(){
        var vm = this;
        this.toSearch(this.keywords);
      },
      dateFormat:function(row, column) {  
        var date = row[column.property];  
        if (date == undefined) {  
          return "";  
        }  
        return moment(date).format("YYYY-MM-DD");  
      },
      xuanze(){
        // console.log(this.title);
        if(this.title == '修改学生信息'){
          this.update();
        }else{
          this.handleSubmit();
        }
      },
      handleEdit(index,row){
        this.dialogFormVisible = true;
        this.title = '修改学生信息';
        this.form = row;
      },
      update(){
        this.dialogFormVisible = false;
        var vm = this;
        this.updateStudent(this.form).then(function(result){
          vm.$message({
            type:'success',
            message:'操作成功!'
          });
        }).catch(function(error){
          vm.$message({
            type: 'error',
            message: '操作失败!'
          });
        });
      },
      handleDelete(index,row){
        var id = row.id;
        // console.log(row.id);
        var vm = this;
        this.batchDelete(id).then(function(result){
          vm.$message({
            type:'success',
            message:'删除成功!'
          });
        }).catch(function(error){
          vm.$message({
            type: 'error',
            message: '删除失败!'
          });
        });
      },
      handleSubmit(){
        this.dialogFormVisible = false;
        var vm = this;
        this.saveStudent(this.form).then(function(result){
          vm.$message({
            type:'success',
            message:'操作成功!'
          });
        }).catch(function(error){
          vm.$message({
            type: 'error',
            message: '操作失败!'
          });
        });
      },
      handleSingleSave(){
        this.dialogFormVisible = true;
        this.title='录入学生信息';
        this.form = {
          gender : '女'
        };
      },
      ...mapActions([
        'findAllStudent',
        'findAllClass',
        'saveStudent',
        'batchDelete',
        'updateStudent',
        'toSearch'
      ])
    }
	}
</script>
<style scoped>
  .saveOptions{
    text-align: right;
  }
  .StudentInfo .header {
    margin: 5px 0;
  }
  .table{
    height: 500px;
    overflow: auto;
  }
</style>
