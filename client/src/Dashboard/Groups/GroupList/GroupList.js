import "./GroupList.css";
// import { Navigate } from "react-router-dom";

export default function GroupList({
  groupName,
  numOfUsers,
  users,
  index,
  setInGroup,
  setViewingGroup,
  group,
}) {
  // const mappedUsersPic = users.map((user) => <img key = {user.username}src = {user.prof_pic} alt = {user.username} className = 'card_prof_pic'/> )
  // need to make user authentication so I can move forward onClick={() => <Navigate to = {"/GroupRoom"}/>

  function handleViewGroup(e) {
    e.preventDefault();
    fetch(`/groups/${group.id}`)
      .then((response) => response.json())
      .then((data) => {
        if (data.error) {
          console.log(data.errors);
        } else {
          // console.log(data);
          setInGroup(true);
          setViewingGroup(data);
        }
      })
      .catch((error) => console.error(error));
  }

  // function handleViewGroup(){
  //   setInGroup(true)
  //   setViewingGroup(group)
  // }

  return (
    <div className="group_card" onClick={(e) => handleViewGroup(e)}>
      <div className={"card_group"}>
        <div className="left_card">
          <h2 className="group_title">{groupName}</h2>
          <h3 className="num_mem"> Members: {numOfUsers}</h3>
        </div>
        <div className="right_card"></div>
      </div>
      <div></div>
    </div>
  );
}
