import React from 'react';
import song from './Song';

const songList = ({ songs, updatesong, deletesong }) => (
  <div className="row">
    { songs.map( song => 
        <song
          key={song.id}
          {...song}
          updatesong={updatesong}
          deletesong={deletesong}
        />
      )
    }
  </div>
)

export default songList;