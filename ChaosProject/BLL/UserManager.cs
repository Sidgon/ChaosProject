using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class UserManager
    {
        private Model1Container context;

        public UserManager()
        {
            context = new Model1Container();
        }
        
        public List<User> GetUsers()
        {
            return context.Users.ToList();
        }

        public User GetSingleUser(int id)
        {
            return context.Users.Find(id);
        }

        public void insertUser(User u)
        {
            context.Users.Add(u);
            context.SaveChanges();
        }

        public int checkUser(String username, String userPW)
        {
            foreach (User u in context.Users)
            {
                if (u.Login.Equals(username) && u.Password.Equals(userPW))
                {
                    return u.Id;
                }
            }
            return -1;
        }
    }
}
