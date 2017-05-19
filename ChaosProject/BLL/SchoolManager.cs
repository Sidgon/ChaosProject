using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class SchoolManager
    {

        private Model1Container context;

        public SchoolManager()
        {
            context = new Model1Container();
        }

        public List<School> getSchools()
        {
            return context.Schools.ToList();
        }

        public School getSingleSchool(int id)
        {
            return context.Schools.Find(id);
        }

        public void insertSchool(School school)
        {
            context.Schools.Add(school);
            context.SaveChanges();
        }
    }
}
