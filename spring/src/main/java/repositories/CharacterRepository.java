package repositories;

import entity.characters.CharacterMdl;
import org.springframework.data.repository.CrudRepository;

public interface CharacterRepository  extends CrudRepository<CharacterMdl,Long> {
}
