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
            List<User> test = context.Users.ToList();

            return test;
        }

        public User GetSingleUser(int id)
        {
            return context.Users.Find(id);
        }

        public int insertUser(User user)
        {
            List<User> users = new List<User>();
            users = GetUsers();
            if (users != null)
            {
                foreach (User u in users)
                {
                    if (user.Login.Equals(u.Login))
                    {
                        return -1;
                    }
                }
            }

            context.Users.Add(user);
            context.SaveChanges();
            return user.Id;

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
