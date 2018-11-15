// import React, { Component } from 'react';
// import {connect} from 'react-redux';

// class ArticlesWrapper extends Component {
//   render() {
//     return (
//       <div>
//         <h2>Anywhere Reader</h2>
//         <hr />

//         <h3>Notes</h3>
//         <table>
//           <tbody>
//             {this.props.notes.map(note => (
//               <tr>
//                 <td>{note.text}</td>
//                 <td><button>edit</button></td>
//                 <td><button>delete</button></td>
//               </tr>
//             ))}
//           </tbody>
//         </table>
//       </div>
//     )
//   }
// }

// const mapStateToProps = state => {
//   return {
//     notes: state.notes,
//   }
// }

// const mapDispatchToProps = dispatch => {
//   return {
//   }
// }

// export default connect(mapStateToProps, mapDispatchToProps)(ArticlesWrapper);
