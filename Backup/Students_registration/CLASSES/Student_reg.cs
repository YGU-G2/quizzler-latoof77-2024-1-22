using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Students_registration.CLASSES
{
    class Student_reg
    {
        //properties or attributes
        public int id;
        public string first_name;
        public string last_name;
        public int age;
        public string gender;
        public string address;

        //constructor
        public Student_reg() {
            this.id = 0;
            this.first_name = "";
            this.last_name = "";
            this.age = 0;
            this.gender = "";
            this.address = "";
        }

        //save method
        public void save() {
            string sql = "";
            sql = "INSERT INTO registered_students VALUES(NULL,'" +
                this.first_name + "','" + this.last_name + "'," +
                this.age +",'"+this.gender+ ",'" + this.address + "');";
            try {
            GLOBAL_VARS.d.executeNonReader(sql);
            }
            catch(Exception e){
                MessageBox.Show(e.Message);
            }
        }

        public void loadStudents(ListView lsv) {
            lsv.Items.Clear();
            string sql = "SELECT * FROM registered_students;";
            GLOBAL_VARS.d.execute(sql);
            if(GLOBAL_VARS.d.reader.HasRows){
                while(GLOBAL_VARS.d.reader.Read()){
                    int i = lsv.Items.Count;
                    lsv.Items.Add(GLOBAL_VARS.d.reader["id"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["first_name"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["last_name"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["age"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["gender"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["address"].ToString());
                }
            }
            //GLOBAL_VARS.d.reader.Close();
        }

        public void loadStudent(int id) {
            string sql = "SELECT * FROM `students`.`registered_students` "+
                         "WHERE id="+id+";";
            try
            {
                GLOBAL_VARS.d.execute(sql);
                if (GLOBAL_VARS.d.reader.HasRows)
                {
                    GLOBAL_VARS.d.reader.Read();
                    this.id = Convert.ToInt32(GLOBAL_VARS.d.reader["id"].ToString());
                    this.first_name = GLOBAL_VARS.d.reader["first_name"].ToString();
                    this.last_name = GLOBAL_VARS.d.reader["last_name"].ToString();
                    this.age = Convert.ToInt32(GLOBAL_VARS.d.reader["age"].ToString());
                    this.gender = GLOBAL_VARS.d.reader["gender"].ToString();
                    this.address = GLOBAL_VARS.d.reader["address"].ToString();
                }
            }
            catch (Exception e) {
                MessageBox.Show(e.Message);
            }
            finally{
                GLOBAL_VARS.d.reader.Close();
            }
        }

        public void updateStudent() {
            string sql = "UPDATE `students`.`registered_students` "+
                         "SET first_name='"+this.first_name+"', "+
                         "last_name='"+this.last_name+"', "+
                         "age="+this.age+", "+
                         "gender='"+this.gender+"', "+
                         "address='"+this.address+"' "+
                         "WHERE id="+this.id+";";
            GLOBAL_VARS.d.executeNonReader(sql);
        }

        public void deleteStudent() {
            string sql = "DELETE FROM registered_students "+
                         "WHERE id="+this.id+";";
            GLOBAL_VARS.d.executeNonReader(sql);
        }

        public void searchStudent(string keyword, ListView lsv) {
            lsv.Items.Clear();
            string sql = "SELECT * FROM `students`.`registered_students` "+
                         "where first_name like '"+keyword+"%' OR "+
                         "last_name like '" + keyword + "%' OR "+
                         "address like '" + keyword + "%';";
            GLOBAL_VARS.d.execute(sql);

            if (GLOBAL_VARS.d.reader.HasRows)
            {
                while (GLOBAL_VARS.d.reader.Read())
                {
                    int i = lsv.Items.Count;
                    lsv.Items.Add(GLOBAL_VARS.d.reader["id"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["first_name"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["last_name"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["age"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["gender"].ToString());
                    lsv.Items[i].SubItems.Add(GLOBAL_VARS.d.reader["address"].ToString());
                }
            }
            GLOBAL_VARS.d.reader.Close();
        }
    }
}
