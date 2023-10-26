abstract class Mapper<E, M> {
  M formEntity(E entity);
  E toEntity(M model);
}
