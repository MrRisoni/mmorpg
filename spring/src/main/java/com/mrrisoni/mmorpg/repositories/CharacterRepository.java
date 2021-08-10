package com.mrrisoni.mmorpg.repositories;

import com.mrrisoni.mmorpg.entity.characters.CharacterMdl;
import org.springframework.data.repository.CrudRepository;

public interface CharacterRepository  extends CrudRepository<CharacterMdl,Long> {
}
